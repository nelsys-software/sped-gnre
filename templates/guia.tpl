<html>
    <meta charset="UTF-8"/>
    <style type="text/css">
        @page {
            margin: 5px;
            padding:0px;
        }
        body{
            margin:5px;
            padding:0px;
            font-size: 0.54rem;
        }
        table tr td{
            border: 1px solid #000;
        }
        .columnone{
            width: 500px;
        }
        .gnre{
            font-size: 14px;
            height:25px;
            font-weight:bold;
            text-align: center;
        }
        .noborder{
            border-top: 0px;
            border-bottom: 0px;
            border-left: 0px;
            border-right: 0px;
        }
        .center{
            text-align: center;
        }
        .nobrdtb{
            border-top: 0px;
            border-bottom: 0px;
        }
        .noleft{
            border-left: 0px;
        }

        .nobottom{
            border-bottom: 0px;
        }
        .notop{
            border-top: 0px;
        }

        .noright{
            border-right: 0px;
        }

        .borderleft{
            border-top: 0px;
            border-bottom: 0px;
            border-right: 0px;
        }

        .borderbottom{
            border-top: 0px;
            border-left: 0px;
            border-right: 0px;
        }

        .borderright{
            border-top: 0px;
            border-bottom: 0px;
            border-left: 0px;
        }

    </style>
    <body>
        {foreach $guiaViaInfo as $key => $via}
            <table cellspacing="0" cellpadding="1" style="width:100%;">
                <tr>
                    <td style="width: 65%;" valign="top" class="noborder">
                        <table cellspacing="0" cellpadding="1" style="width:100%">
                            <tr>
                                <td class="columnone gnre" colspan="2">
                                    Guia Nacional de Recolhimento de Tributos Estaduais - GNRE
                                </td>
                            </tr>
                            <tr>
                                <td class="center nobrdtb" colspan="2">
                                    Dados do emitente
                                </td>
                            </tr>
                            <tr>
                                <td class="borderleft">
                                    Razão Social
                                </td>
                                <td class="borderright" style="width: 50px">
                                    CNPJ/CPF/Insc. Est.
                                </td>
                            </tr>
                            <tr>
                                <td class="borderleft">
                                    {$guia['contribuinteEmitenteRazaoSocial']}
                                </td>
                                <td class="borderright">
                                    {$guia['contribuinteEmitente_identificacao']}
                                </td>
                            </tr>
                            <tr>
                                <td class="notop nobottom" colspan="2">
                                    Endereço: {$guia['contribuinteEmitenteEndereco']}
                                </td>
                            </tr>
                            <tr>
                                <td class="borderleft">
                                    Município: {$guia['contribuinteEmitente_municipio']}
                                </td>
                                <td class="borderright">
                                    UF: {$guia['contribuinteEmitenteUf']}
                                </td>
                            </tr>
                            <tr>
                                <td class="noright notop">
                                    CEP: {$guia['contribuinteEmitenteCep']}
                                </td>
                                <td class="noleft notop">
                                    DDD/Telefone: {$guia['contribuinteEmitenteTelefone']}
                                </td>
                            </tr>
                            <tr >
                                <td class="center nobrdtb" colspan="2">
                                    Dados do Destinatário
                                </td>
                            </tr>
                            <tr>
                                <td class="notop nobottom" colspan="2">
                                    CNPJ/CPF/Insc. Est.: {$guia['contribuinteEmitente_identificacao']}
                                </td>
                            </tr>
                            <tr>
                                <td class="notop" colspan="2">
                                    Município: {$guia['itensGNRE0ContribuinteDestinatario_municipio']}
                                </td>
                            </tr>
                            <tr>
                                <td class="center nobrdtb" colspan="2">
                                    Informações à Fiscalização
                                </td>
                            </tr>
                            <tr>
                                <td class="notop nobottom" colspan="2">
                                    Convênio/Protocolo: {$guia['_convenio']}
                                </td>
                            </tr>
                            <tr>
                                <td class="notop" colspan="2">
                                    Produto: {$guia['itensGNRE0Produto']}
                                </td>
                            </tr>
                            <tr>
                                <td class="nobrdtb" colspan="2" style="height:64px" valign="top">
                                    Informações Complementares: {$guia['retornoInformacoesComplementares']}
                                </td>
                            </tr>
                            <tr>
                                <td class="notop" colspan="2">
                                    Documento válido para pagamento até {$guia['itensGNRE0_dataVencimento']}
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="noborder" valign="top">
                        <table cellspacing="0" cellpadding="1" style="width:100%; margin-left: -1px;">
                            <tr>
                                <td class="nobottom">UF Favorecida</td>
                                <td style="width: 120px" colspan="2" class="nobottom">Código da Receita</td>
                            </tr>
                            <tr>
                                <td class="notop" align="right">{$guia['ufFavorecida']}</td>
                                <td class="notop" align="right" colspan="2">{$guia['itensGNRE0Receita']}</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="nobottom">Nº de Controle</td>
                            </tr>
                            <tr>
                                <td colspan="3" align="right" class="notop">{$guia['retornoNumeroDeControle']}</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="nobottom">Data de Vencimento</td>
                            </tr>
                            <tr>
                                <td colspan="3" align="right" class="notop">{$guia['itensGNRE0_dataVencimento']}</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="nobottom">Nº do Documento de Origem</td>
                            </tr>
                            <tr>
                                <td colspan="3" align="right" class="notop">{$guia['itensGNRE0DocumentoOrigem_value']}</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="nobottom">Período de Referência</td>
                                <td class="nobottom" align="left">Nº Parcela</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="notop" align="right">{$guia['itensGNRE0ReferenciaMes']}/{$guia['itensGNRE0ReferenciaAno']}</td>
                                <td class="notop" align="right">{$guia['itensGNRE0ReferenciaParcela']}</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="nobottom">Valor Principal</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="notop" align="right">R$ {$guia['itensGNRE00_11_valor']}</td> {*valorPrincipal*}
                            </tr>
                            <tr>
                                <td colspan="3" class="nobottom">Atualização Monetária</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="notop" align="right">R$ {$guia['retornoAtualizacaoMonetaria']}</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="nobottom">Juros</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="notop" align="right">R$ {$guia['retornoJuros']}</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="nobottom">Multa</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="notop" align="right">R$ {$guia['retornoMulta']}</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="nobottom">Total a Recolher</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="notop" align="right">R$ {$guia['_valorGNRE']}</td> {*valorTotal*}
                            </tr>
                            <tr>
                                <td class="noborder" colspan="3" style="text-align:right;">{$via}</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="noborder" style="padding-left:140px;">
                        {$guia['retornoRepresentacaoNumerica']}
                    </td>
                </tr>
                <tr>
                    <td class="noborder" style="padding-left:90px;" >
                        <img src="data:image/jpeg;base64,{$barcode->getCodigoBarrasBase64()}"/>
                    </td>
                </tr>
            </table>
            <br/>
        {/foreach}
    </body>
</html>
