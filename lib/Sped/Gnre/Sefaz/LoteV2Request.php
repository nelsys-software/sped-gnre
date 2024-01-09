<?php

namespace Sped\Gnre\Sefaz;

use GuzzleHttp\ClientInterface;
use Symfony\Component\Console\Output\OutputInterface;

class LoteV2Request
{
    public int $recibo = 0;
    private ClientInterface $httpClient;
    private bool $isTestEnv;
    private OutputInterface $output;
    private $response;
    private $body;

    public function __construct(
        $certPass = 'mudar123@',
        $certPath = 'data/certificado/certificado.pfx',
        $isTestEnv = false,
        ClientInterface $httpClient = null
    ){
        $this->isTestEnv = $isTestEnv;
        $this->httpClient = $httpClient ?: new \GuzzleHttp\Client([
            'base_uri' => $this->getSoapEndpoint(),
            'cert'     => [$certPath, $certPass],
            'curl'     => [CURLOPT_SSLCERTTYPE => 'P12']
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

            $this->body = $body;
            $this->response = $xml->asXML();

            if (!array_key_exists(0, $xml->xpath('//ns1:numero'))) {
                return false;
            }

            $this->recibo = (string) $xml->xpath('//ns1:numero')[0];

            return [
                'XmlEnvio' => $body,
                'XmlRecibo' => $xml->asXML(),
                'recibo' => $this->recibo
            ];
        } catch (\Exception $e) {
//            $output->writeln($e->getMessage());
//            $output->writeln('at line:' . $e->getLine());
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
            $xml->registerXPathNamespace('ns1', $this->getSoapEndpoint());

            $this->body = $body;
            $this->response = $xml->asXML();

            if (!array_key_exists(0, $xml->xpath('//ns1:codigoBarras'))) {
                return false;
            }

            return [
                'XmlGNRE' => $xml->asXML(),
                'retornoCodigoDeBarras' => (string) $xml->xpath('//ns1:codigoBarras')[0],
                'linhaDigitavel' => (string) $xml->xpath('//ns1:codigoBarras')[0],
                'retornoRepresentacaoNumerica' => (string) $xml->xpath('//ns1:linhaDigitavel')[0],
                'retornoInformacoesComplementares' => (string) $xml->xpath('//ns1:informacao')[0],
                'retornoNumeroDeControle' => (string) $xml->xpath('//ns1:nossoNumero')[0],
                'retornoAtualizacaoMonetaria' => 0,
                'retornoJuros' => 0,
                'retornoMulta' => 0,
            ];
        } catch (\Exception $e) {
//            $output->writeln($e->getMessage());
//            $output->writeln('at line:' . $e->getLine());
            return false;
        }
    }

    public function getSoapEndpoint()
    {
        return $this->isTestEnv ? 'https://www.testegnre.pe.gov.br' : 'https://www.gnre.pe.gov.br';
    }

    public function getResponse()
    {
        return $this->response;
    }

    public function getBody()
    {
        return $this->body;
    }
}
