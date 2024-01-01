<?php

namespace Sped\Gnre\Sefaz;

class LoteV2Builder
{
    protected $data;
    private $action;

    public function __construct(array $data, $testEnv = false)
    {
        $this->data = $data;
        $this->action = $testEnv ?
            'http://www.testegnre.pe.gov.br/webservice/GnreLoteRecepcao':
            'http://www.gnre.pe.gov.br/webservice/GnreLoteRecepcao';
    }

    public function buildXML()
    {
        $envelope = new \SimpleXMLElement($this->getEnvelope());

        $envelope->registerXPathNamespace('gnre', $this->action);
        $tagLoteGNRE = $envelope->xpath('//gnre:TLote_GNRE')[0];

        $this->buildNode($tagLoteGNRE, $this->data);

        return $envelope->asXML();
    }

    protected function buildNode(\SimpleXMLElement $parent, array $data)
    {
        foreach ($data as $nodeName => $nodeValue) {
            if (!is_array($nodeValue)) {
                $parent->addChild($nodeName, $nodeValue);
                continue;
            }

            $nodeName = is_int($nodeName) ? $nodeValue['_tag'] : $nodeName;
            $value = array_key_exists('_value', $nodeValue) ? $nodeValue['_value'] : null;

            $node = $parent->addChild($nodeName, $value);

            if (array_key_exists('_attributes', $nodeValue)) {
                foreach ($nodeValue['_attributes'] as $attribute => $value) {
                    $node->addAttribute($attribute, $value);
                }
            }

            unset($nodeValue['_attributes']);
            unset($nodeValue['_value']);
            unset($nodeValue['_tag']);

            $this->buildNode($node, $nodeValue);
        }
    }

    private function getEnvelope()
    {
        $endpoint = 'http://www.gnre.pe.gov.br/wsdl/processar';
        $version = '2.0';

        return sprintf('
            <soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
                xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
                <soap12:Header>
                    <gnreCabecMsg xmlns="%s">
                        <versaoDados>%s</versaoDados>
                    </gnreCabecMsg>
                </soap12:Header>
                <soap12:Body>
                    <gnreDadosMsg xmlns="%s">
                        <TLote_GNRE versao="%s"></TLote_GNRE>
                    </gnreDadosMsg>
                </soap12:Body>
            </soap12:Envelope>',
            $endpoint,
            $version,
            $this->action,
            $version
        );
    }
}