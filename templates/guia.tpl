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


        .table {
            display: table;
            width: 100%;
            border: 1px solid #000000;
        }

        .row {
            display: table-row;
        }

        .cell {
            display: table-cell;
            padding: 5px;
        }

        .colspan {
            width: 100%;
        }

        .border-bottom {
            border-bottom: 1px solid #000000;
        }
        .p0 {
            padding: 0;
            margin: 0;
        }
        .b0 {
            margin-bottom: 0; padding-bottom: 0;
        }
    </style>
    <body>
        {foreach $guiaViaInfo as $key => $via}
            <table cellspacing="0" cellpadding="1" style="width:100%;">
                <tr>
                    <td style="width: 100%;" valign="top" class="noborder">
                        <div class="table">
                            <div class="border-bottom" style="width:100%;text-align: center;">
                                <h2>Guia Nacional de Recolhimento de Tributos Estaduais - GNRE</h2>
                            </div>
                            <div class="border-bottom">
                                <div style="width:100%;text-align: center;">
                                    <h4 class="p0">Dados do emitente</h4>
                                </div>
                                <div style="width:65%; float:left;">
                                    <p class="b0">Razão Social <br> {$guia['contribuinteEmitenteRazaoSocial']}</p>
                                </div>
                                <div style="width:35%; float:right;">
                                    <p class="b0">CNPJ/CPF/Insc. Est. <br> {$guia['contribuinteEmitente_identificacao']}</p>
                                </div>

                                <div style="width:100%;">
                                    <p class="p0">Endereço: {$guia['contribuinteEmitenteEndereco']}</p>
                                </div>

                                <div style="width:65%; float:left;">
                                    <p class="p0">Município: {$guia['contribuinteEmitente_municipio']}</p>
                                </div>

                                <div style="width:35%; float:right;">
                                    <p class="p0">UF: {$guia['contribuinteEmitenteUf']}</p>
                                </div>

                                <div style="clear: both"></div>

                                <div style="width:65%; float:left;">
                                    <p style="margin-top: 0; padding-top: 0">CEP: {$guia['contribuinteEmitenteCep']}</p>
                                </div>
                                <div style="width:35%; float:right;">
                                    <p style="margin-top: 0; padding-top: 0">DDD/Telefone: {$guia['contribuinteEmitenteTelefone']}</p>
                                </div>
                                <div style="clear: both"></div>
                            </div>
                            <div class="border-bottom">
                                <div style="width:100%;text-align: center;">
                                    <h4 class="p0">Dados do Destinatário</h4>
                                </div>

                                <div style="width:100%;">
                                    <p class="p0">CNPJ/CPF/Insc. Est.: {$guia['contribuinteEmitente_identificacao']}</p>
                                </div>

                                <div style="width:100%;">
                                    <p style="margin-top: 0;padding-top: 0">Município: {if 'itensGNRE0ContribuinteDestinatario_municipio'|array_key_exists:$guia}{$guia['itensGNRE0ContribuinteDestinatario_municipio']}{/if}</p>
                                </div>
                            </div>

                            <div class="border-bottom">
                                <div style="width:100%;text-align: center;">
                                    <h4 class="p0">Informações à Fiscalização</h4>
                                </div>

                                <div style="width:100%;">
                                    <p class="p0">Convênio/Protocolo: {if '_convenio'|array_key_exists:$guia}{$guia['_convenio']}{/if}</p>
                                </div>

                                <div style="width:100%;" >
                                    <p style="margin-top: 0;padding-top: 0">Produto: {if 'itensGNRE0Produto'|array_key_exists:$guia}{$guia['itensGNRE0Produto']}{/if}</p>
                                </div>
                            </div>

                            <div>
                                <div style="width:100%;">
                                    <p>Informações Complementares: {$guia['retornoInformacoesComplementares']}</p>
                                </div>

                                <div style="width:100%;">
                                    <p style="margin-top: 0;padding-top: 0">Documento válido para pagamento até {$guia['itensGNRE0_dataVencimento']}</p>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td style="width: 100%;" class="noborder" valign="top">
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
                                <td colspan="3" align="right" class="notop">{if 'itensGNRE0DocumentoOrigem_value'|array_key_exists:$guia}{$guia['itensGNRE0DocumentoOrigem_value']}{/if}</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="nobottom">Período de Referência</td>
                                <td class="nobottom" align="left">Nº Parcela</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="notop" align="right">{$guia['itensGNRE0ReferenciaMes']}/{$guia['itensGNRE0ReferenciaAno']}</td>
                                <td class="notop" align="right">{if 'itensGNRE0ReferenciaParcela'|array_key_exists:$guia}{$guia['itensGNRE0ReferenciaParcela']}{/if}</td>
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
