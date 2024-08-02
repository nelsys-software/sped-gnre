<?php

namespace Sped\Gnre\Sefaz;

use GuzzleHttp\ClientInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Sped\Gnre\Sefaz\LoteV2ConsultaBuilder;

class LoteV2Request
{
    public int $recibo = 0;
    private ClientInterface $httpClient;
    private bool $isTestEnv;
    private OutputInterface $output;
    private $response;
    private $body;
    private $codigoSituacaoProcess;

    public function __construct(
        $certKey = 'data/certificado/certificadoKey.pem',
        $certPath = 'data/certificado/certificado.pem',
        $isTestEnv = false,
        ClientInterface $httpClient = null
    ){
        $this->isTestEnv = $isTestEnv;
        $this->httpClient = $httpClient ?: new \GuzzleHttp\Client([
            'base_uri' => $this->getSoapEndpoint(),
            'curl'     => [
				CURLOPT_SSLCERTTYPE => 'PEM',
				CURLOPT_SSL_VERIFYHOST => 0, CURLOPT_SSL_VERIFYPEER => 0,
				CURLOPT_SSLCERT => $certPath, CURLOPT_SSLKEY => $certKey
			]
        ]);
    }
    public function enviarLote(LoteV2Builder $xmlBuilder): bool|array
    {
        $action = sprintf('"%s/gnreWS/services/GnreLoteRecepcao"', $this->getSoapEndpoint());
        $body = $xmlBuilder->buildXML();
        try {
            $response = $this->httpClient->request('POST', 'gnreWS/services/GnreLoteRecepcao', [
                'headers' => [
                    'Content-Type' => 'application/soap+xml',
                    'charset' => 'utf-8',
                    'action' => $action,
                    'SOAPAction' => 'processar'
                ],
                'body' => $body
            ]);

            $xml = simplexml_load_string($response->getBody()->getContents());
            $xml->registerXPathNamespace('ns1', $this->getSoapEndpoint(false));
             
            $getValue = function ($ns, $expression) use ($xml) {
                $parts = explode('.', $expression);
                $path = $xml;

                foreach ($parts as $part) {
                    $path = $path->xpath($ns . $part);
                    
                    if (!array_key_exists(0, $path)) {
                        throw new \Exception("Caminho ".$part." não existe", 1);
                    }

                    $path = $path[0];
                }

                if (!$path) {
                    return null;
                }

                return (string) $path[0];
            };

            $this->body = $body;
            $this->response = $xml->asXML();
            $this->codigoSituacaoProcess = $getValue('//ns1:','situacaoRecepcao.codigo');
            $this->recibo = $getValue('//ns1:', 'numero');

            if (!$this->recibo && !$this->codigoSituacaoProcess) {
                return false;
            }

	    return true;
	    
        } catch (\Exception $e) {
            $this->body = $body;
            $this->response = $e->getMessage();
	    var_dump($e->getMessage());
            return false;
        }
    }

    public function consultarLote($recibo = null): bool|array
    {
        $action = sprintf('"%s/gnreWS/services/GnreResultadoLote"', $this->getSoapEndpoint());
        $body = (new LoteV2ConsultaBuilder($recibo ?: $this->recibo, $this->isTestEnv))->buildXML();

        try {
            $response = $this->httpClient->request('POST', 'gnreWS/services/GnreResultadoLote', [
                'headers' => [
                    'Content-Type' => 'application/soap+xml',
                    'charset' => 'utf-8',
                    'action' => $action,
                    'SOAPAction' => 'consultar'
                ],
                'body' => $body
            ]);
            $xml = simplexml_load_string($response->getBody()->getContents());
            $xml->registerXPathNamespace('ns1', $this->getSoapEndpoint(false));

            $getValue = function ($ns, $expression) use ($xml) {
                $parts = explode('.', $expression);
                $path = $xml;

                foreach ($parts as $part) {
                    $path = $path->xpath($ns . $part);
                    
                    if (!array_key_exists(0, $path)) {
                        // throw new \Exception($xml->asXML() . "Caminho ".$part." não existe", 1);
                        return null;
                    }

                    $path = $path[0];
                }

                if (!$path) {
                    return null;
                }

                return (string) $path[0];
            };


            $this->body = $body;
            $this->response = $xml->asXML();
            $this->codigoSituacaoProcess = $getValue('//ns1:','situacaoProcess.codigo');

            if (!$getValue('//ns1:','codigoBarras') && !$this->codigoSituacaoProcess) {
                return false;
            }

            return [
                'retornoCodigoDeBarras' => $getValue('//ns1:','codigoBarras'),
                'linhaDigitavel' => $getValue('//ns1:','codigoBarras'),
                'retornoRepresentacaoNumerica' => $getValue('//ns1:','linhaDigitavel'),
                'retornoInformacoesComplementares' => $getValue('//ns1:','informacao'),
                'retornoNumeroDeControle' => $getValue('//ns1:','nossoNumero'),
                'retornoAtualizacaoMonetaria' => 0,
                'retornoJuros' => 0,
                'retornoMulta' => 0,
            ];
        } catch (\Exception $e) {
            $this->body = $body;
            $this->response = $e->getMessage();
            return false;
        }
    }

    public function getSoapEndpoint($https = true)
    {
        return sprintf(
            '%s://%s',
            $https ? 'https': 'http',
            $this->isTestEnv ? 'www.testegnre.pe.gov.br' : 'www.gnre.pe.gov.br'
        );
    }

    public function getResponse()
    {
        return $this->response;
    }

    public function getBody()
    {
        return $this->body;
    }

    public function getRecibo()
    {
        return $this->recibo;
    }

    public function getCodigoSituacaoProcess()
    {
        return $this->codigoSituacaoProcess;
    }
}
