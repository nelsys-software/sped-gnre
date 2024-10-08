<?php

namespace Sped\Gnre\Sefaz;

class LoteV2Builder
{
    protected $data;
    private string $xmlns;

    public function __construct(array $data, $testEnv = false)
    {
        $this->data = $data;
        $this->xmlns = $testEnv ? 'http://www.testegnre.pe.gov.br' : 'http://www.gnre.pe.gov.br';
    }

    public function buildXML()
    {
        $envelope = new \SimpleXMLElement($this->getEnvelope());
        $envelope->registerXPathNamespace('gnre', $this->xmlns);

        $tagLoteGNRE = $envelope->xpath('//gnre:TLote_GNRE')[0];

        $this->buildNode($tagLoteGNRE, $this->data);

        return $envelope->asXML();
    }

    protected function buildNode(\SimpleXMLElement $parent, array $data)
    {
        foreach ($data as $nodeName => $nodeValue) {
            if (is_null($nodeValue)) {
                continue;
            }

            if (str_starts_with($nodeName,'_')) {
                continue;
            }

            if (!is_array($nodeValue)) {
                $parent->addChild($nodeName, $nodeValue);
                continue;
            }

            if (empty($nodeValue)) {
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
        $version = '2.00';

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
                        <TLote_GNRE xmlns="%s" versao="%s"></TLote_GNRE>
                    </gnreDadosMsg>
                </soap12:Body>
            </soap12:Envelope>',
            $this->xmlns . '/wsdl/processar',
            $version,
            $this->xmlns . '/webservice/GnreLoteRecepcao',
            $this->xmlns,
            $version
        );
    }
}
