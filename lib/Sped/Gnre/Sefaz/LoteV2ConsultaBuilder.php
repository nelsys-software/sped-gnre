<?php

/**
 * Este arquivo é parte do programa GNRE PHP
 * GNRE PHP é um software livre; você pode redistribuí-lo e/ou
 * modificá-lo dentro dos termos da Licença Pública Geral GNU como
 * publicada pela Fundação do Software Livre (FSF); na versão 2 da
 * Licença, ou (na sua opinião) qualquer versão.
 * Este programa é distribuído na esperança de que possa ser  útil,
 * mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a qualquer
 * MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
 * Licença Pública Geral GNU para maiores detalhes.
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU
 * junto com este programa, se não, escreva para a Fundação do Software
 * Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

namespace Sped\Gnre\Sefaz;

/**
 * Classe utilzada para gerar o envelope SOAP para ser enviado ao web service
 * da SEFAZ para realizar a operação de consulta.
 * @package     gnre
 * @subpackage  sefaz
 * @author      Matheus Marabesi <matheus.marabesi@gmail.com>
 * @license     http://www.gnu.org/licenses/gpl-howto.html GPL
 * @version     1.0.0
 */
class LoteV2ConsultaBuilder
{
    private string $xmlns;
    private $recibo;
    /**
     * @var bool
     */
    private bool $testEnv;

    public function __construct($recibo, $testEnv = false)
    {
        $this->recibo = $recibo;
        $this->xmlns = $testEnv ? 'http://www.testegnre.pe.gov.br' : 'http://www.gnre.pe.gov.br';
        $this->testEnv = $testEnv;
    }

    public function buildXML()
    {
        $envelope = new \SimpleXMLElement($this->getEnvelope());
        $envelope->registerXPathNamespace('gnre', $this->xmlns);

        $tagConsLoteGNRE = $envelope->xpath('//gnre:TConsLote_GNRE')[0];

        $this->buildNode($tagConsLoteGNRE, [
            'ambiente' => (int) !$this->testEnv,
            'numeroRecibo' => $this->recibo
        ]);

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
                        <TConsLote_GNRE xmlns="%s"></TConsLote_GNRE>
                    </gnreDadosMsg>
                </soap12:Body>
            </soap12:Envelope>',
            $this->xmlns . '/wsdl/consultar',
            $version,
            $this->xmlns . '/webservice/GnreResultadoLote',
            $this->xmlns,
        );
    }
}
