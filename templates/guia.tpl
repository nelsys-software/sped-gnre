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
            padding-top: 10px;
            font-size: 0.54rem;
            font-family: Arial, sans-serif;
        }

        .clear {
            clear: both;
        }

        .titulo {
            font-weight:bold;
        }

        .guia-container {
            margin-bottom: 2px;
            width: 680px;
            margin-left: auto;
            margin-right: auto;
        }

        .guia {
            border: 1px solid #000;
            
            font-size: 0;
        }

        .guia .dados, .guia .valores {
            font-size: 0.58rem;
        }

        .guia > div {
            display: inline-block;
            vertical-align: top;
        }

        .guia .dados {
            width:70%;
            border-right: 1px solid #000;
        }

        .guia .dados > .titulo {
            text-align: center;
            font-size: 0.75rem;
            padding-top: 4px;
            padding-bottom: 1.3%;
            border-bottom: 1px solid #000;
        }

        .guia .dados .contribuinte-emitente > .titulo {
            text-align: center;
            font-size: 0.58rem;
        }

        .guia .dados .contribuinte-emitente {
            padding-left: 2px;
            padding-bottom: 2px;
            border-bottom: 1px solid #000;
        }

        .guia .dados .contribuinte-emitente > div {
            margin-bottom: 0.1%;
        }

        .guia .dados .contribuinte-emitente .info-1 > div, .guia .dados .contribuinte-emitente .info-3 > div,
        .guia .dados .contribuinte-emitente .info-4 > div {
            display: inline-block;
            vertical-align: top;
        }

        .guia .dados .contribuinte-emitente .info-1 .razao-social {
            font-size: 0.58rem;
        }

        .guia .dados .contribuinte-emitente .info-1 .cnpj {
            font-size: 0.58rem;
            float: right;
        }

        .guia .dados .contribuinte-emitente .info-1 .cnpj {
            font-size: 0.58rem;
            float: right;
            margin-right: 35px;
        }

        .guia .dados .contribuinte-emitente .info-2 .endereco {
            font-size: 0.58rem;
        }

        .guia .dados .contribuinte-emitente .info-3 .municipio {
            font-size: 0.58rem;
        }

        .guia .dados .contribuinte-emitente .info-3 .uf {
            font-size: 0.58rem;
            float: right;
            margin-right: 85px;
        }

        .guia .dados .contribuinte-emitente .info-4 .cep {
            font-size: 0.58rem;
        }

        .guia .dados .contribuinte-emitente .info-4 .telefone {
            font-size: 0.58rem;
            float: right;
            margin-right: 46px;
        }

        .guia .dados .destinatario {
            padding-left: 2px;
            padding-bottom: 2px;
            border-bottom: 1px solid #000;
        }

        .guia .dados .destinatario .titulo {
            text-align: center;
            font-size: 0.58rem;
        }

        .guia .dados .destinatario .cpf-cnpj, .guia .dados .destinatario .municipio {
            font-size: 0.58rem;
        }

        .guia .dados .fiscalizacao {
            padding-left: 2px;
            padding-bottom: 10px;
            border-bottom: 1px solid #000;
        }

        .guia .dados .fiscalizacao .titulo {
            text-align: center;
            font-size: 0.58rem;
        }

        .guia .dados .fiscalizacao .convenio-protocolo, .guia .dados .fiscalizacao .produto {
            font-size: 0.58rem;
        }

        .guia .dados .complementar {
            padding-left: 2px;
            padding-bottom: 11px;
        }

        .guia .dados .complementar .informacoes-complementares {
            font-size: 0.58rem;
            height: 49px;
        }

        .guia .dados .complementar .documento-valido-pagamento {
            font-size: 0.58rem;
        }

        .guia .valores {
            width: 29.8%;
        }

        .guia .valores .info-1 {
            border-bottom: 1px solid #000;
        }

        .guia .valores .info-1 > div {
            display: inline-block;
            vertical-align: top;
            padding-top: 1px;
            padding-bottom: 0.7%;
            padding-left: 2px;
        }

        .guia .valores .info-1 .uf-favorecida {
            width: 40%;
            border-right: 1px solid #000;
        }

        .guia .valores .info-1 .uf-favorecida, .guia .valores .info-1 .codigo-receita,
        .guia .valores .info-5 .periodo-referencia, .guia .valores .info-5 .parcela {
            font-size: 0.58rem;
        }

        .guia .valores .info-2 .controle, .guia .valores .info-3 .data-vencimento, .guia .valores .info-4 .documento-origem,
        .guia .valores .info-6 .valor-principal, .guia .valores .info-7 .atualizacao-monetaria, .guia .valores .info-8 .juros,
        .guia .valores .info-9 .multa {
            font-size: 0.58rem;
            border-bottom: 1px solid #000;
            padding-left: 2px;
            padding-right: 2px;
            padding-top: 1px;
            padding-bottom: 1px;
        }

        .guia .valores .info-10 .total-recolher {
            font-size: 0.58rem;
            padding-left: 2px;
            padding-right: 2px;
            padding-top: 1px;
            padding-bottom: 1px;
        }

        .guia .valores .info-2 .controle > div, .guia .valores .info-3 .data-vencimento > div,
        .guia .valores .info-4 .documento-origem > div, .guia .valores .info-6 .valor-principal > div,
        .guia .valores .info-7 .atualizacao-monetaria > div, .guia .valores .info-8 .juros > div,
        .guia .valores .info-9 .multa > div, .guia .valores .info-10 .total-recolher > div {
            text-align: left;
        }

        .guia .valores .info-2 .controle, .guia .valores .info-3 .data-vencimento, .guia .valores .info-4 .documento-origem,
        .guia .valores .info-6 .valor-principal, .guia .valores .info-7 .atualizacao-monetaria,
        .guia .valores .info-8 .juros, .guia .valores .info-9 .multa, .guia .valores .info-10 .total-recolher {
            text-align: right;
        }

        .guia .valores .info-5 {
            border-bottom: 1px solid #000;
        }

        .guia .valores .info-5 > div {
            display: inline-block;
            vertical-align: top;
            padding-top: 1px;
            padding-bottom: 0.7%;
            padding-left: 2px;
        }

        .guia .valores .info-5 .periodo-referencia {
            width: 60%;
            border-right: 1px solid #000;
        }

        .guia .valores .info-6 .valor-principal {
            border-bottom: 1px solid #000;
        }

        .guia .valores .info-6 .valor-principal > div {
            text-align: left;
        }

        .guia .valores .info-6 .valor-principal span {
            text-align: right;
        }

        .guia-rodape {
            margin-top: 3px;
            margin-bottom: 1px;
        }
        
        .codigo-barras {
            float: left;
            text-align: left;
        }

        .via {
            float: right;
            margin-right: 5px;
        }

    </style>
    <body>
        {foreach $guiaViaInfo as $key => $via}
            <div class="guia-container">
                <div class="guia">
                    <div class="dados">
                        <div class="titulo">
                            <span>Guia Nacional de Recolhimento de Tributos Estaduais - GNRE</span>
                        </div>
                        <div class="contribuinte-emitente">
                            <div class="titulo">
                                <span>Dados do Contribuinte Emitente</span>
                            </div>
                            <div class="info-1">
                                <div class="razao-social">
                                    <span class="titulo">Razão Social:</span>
                                    <br>
                                    <span>{$guia['contribuinteEmitenteRazaoSocial']}</span>
                                </div>
                                <div class="cnpj">
                                    <span class="titulo">CNPJ/CPF/Insc. Est.:</span>
                                    <br>
                                    <span>{$guia['contribuinteEmitente_identificacao']}</span>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="info-2">
                                <div class="endereco">
                                    <span class="titulo">Endereço:&nbsp;</span>
                                    <span>{$guia['contribuinteEmitenteEndereco']}</span>
                                </div>
                            </div>
                            <div class="info-3">
                                <div class="municipio">
                                    <span class="titulo">Município:&nbsp;</span>
                                    <span>{$guia['contribuinteEmitente_municipio']}</span>
                                </div>
                                <div class="uf">
                                    <span class="titulo">UF:&nbsp;</span>
                                    <span>{$guia['contribuinteEmitenteUf']}</span>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="info-4">
                                <div class="cep">
                                    <span class="titulo">CEP:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <span>{$guia['contribuinteEmitenteCep']}</span>
                                </div>
                                <div class="telefone">
                                    <span class="titulo">Telefone:&nbsp;</span>
                                    <span>{$guia['contribuinteEmitenteTelefone']}</span>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="destinatario">
                            <div class="titulo">
                                <span>Dados do Destinatário</span>
                            </div>
                            <div class="cpf-cnpj">
                                <span class="titulo">CPF/CNPJ/Insc. Est.:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <span>
                                    {if 'itensGNREItemContribuinteDestinatarioIdentificacaoCPF'|array_key_exists:$guia}
                                        {$guia['itensGNREItemContribuinteDestinatarioIdentificacaoCPF']}
                                    {elseif 'itensGNREItemContribuinteDestinatarioIdentificacaoCNPJ'|array_key_exists:$guia}
                                        {$guia['itensGNREItemContribuinteDestinatarioIdentificacaoCNPJ']}
                                    {/if}
                                </span>
                            </div>
                            <div class="municipio">
                                <span class="titulo">Município:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <span>
                                    {if 'itensGNRE0ContribuinteDestinatario_municipio'|array_key_exists:$guia}
                                        {$guia['itensGNRE0ContribuinteDestinatario_municipio']}
                                    {/if}
                                </span>
                            </div>
                        </div>
                        <div class="fiscalizacao">
                            <div class="titulo">
                                <span>Reservado à Fiscalização</span>
                            </div>
                            <div class="convenio-protocolo">
                                <span class="titulo">Convênio/Protocolo:</span>
                                <span>
                                    {if '_convenio'|array_key_exists:$guia}
                                        {$guia['_convenio']}
                                    {/if}
                                </span>
                            </div>
                            <div class="produto">
                                <span class="titulo">Produto:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <span>
                                    {if 'itensGNRE0Produto'|array_key_exists:$guia}
                                        {$guia['itensGNRE0Produto']}
                                    {/if}
                                </span>
                            </div>
                        </div>
                        <div class="complementar">
                            <div class="informacoes-complementares">
                                <span class="titulo">Informações Complementares:&nbsp;&nbsp;&nbsp;</span>
                                <br>
                                <span>{$guia['retornoInformacoesComplementares']}</span>
                            </div>
                            <div class="documento-valido-pagamento">
                                <span class="titulo">Documento Válido para pagamento &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <span>{$guia['itensGNRE0_dataVencimento']}</span>
                            </div>
                        </div>
                    </div>
                    <div class="valores">
                        <div class="info-1">
                            <div class="uf-favorecida">
                                <span class="titulo">UF Favorecida</span>
                                <br>
                                <span>&nbsp;&nbsp;{$guia['ufFavorecida']}</span>
                            </div>
                            <div class="codigo-receita">
                                <span class="titulo">Código da Receita</span>
                                <br>
                                <span>&nbsp;&nbsp;{$guia['itensGNRE0Receita']}</span>
                            </div>
                        </div>
                        <div class="info-2">
                            <div class="controle">
                                <div>
                                    <span class="titulo">Nº de Controle</span>
                                </div>
                                <span>{$guia['retornoNumeroDeControle']}</span>
                            </div>
                        </div>
                        <div class="info-3">
                            <div class="data-vencimento">
                                <div>
                                    <span class="titulo">Data de Vencimento</span>
                                </div>
                                <span>{$guia['itensGNRE0_dataVencimento']}</span>
                            </div>
                        </div>
                        <div class="info-4">
                            <div class="documento-origem">
                                <div>
                                    <span class="titulo">Nº Documento de Origem</span>
                                </div>
                                <span>
                                    {if 'itensGNRE0DocumentoOrigem'|array_key_exists:$guia}
                                        {$guia['itensGNRE0DocumentoOrigem']}
                                    {/if}
                                </span>
                            </div>
                        </div>
                        <div class="info-5">
                            <div class="periodo-referencia">
                                <span class="titulo">Período de Referência</span>
                                <br>
                                <span>&nbsp;&nbsp;{$guia['itensGNRE0ReferenciaMes']}/{$guia['itensGNRE0ReferenciaAno']}</span>
                            </div>
                            <div class="parcela">
                                <span class="titulo">Parcela</span>
                                <br>
                                <span>
                                    {if 'itensGNRE0ReferenciaParcela'|array_key_exists:$guia}
                                        &nbsp;&nbsp;{$guia['itensGNRE0ReferenciaParcela']}
                                    {/if}
                                </span>
                            </div>
                        </div>
                        <div class="info-6">
                            <div class="valor-principal">
                                <div>
                                    <span class="titulo">Valor Principal</span>
                                </div>
                                <span>R$ {$guia['itensGNRE00_11_valor']}</span> {*valorPrincipal*}
                            </div>
                        </div>
                        <div class="info-7">
                            <div class="atualizacao-monetaria">
                                <div>
                                    <span class="titulo">Atualização Monetária</span>
                                </div>
                                <span>R$ {$guia['retornoAtualizacaoMonetaria']}</span>
                            </div>
                        </div>
                        <div class="info-8">
                            <div class="juros">
                                <div>
                                    <span class="titulo">Juros</span>
                                </div>
                                <span>R$ {$guia['retornoJuros']}</span>
                            </div>
                        </div>
                        <div class="info-9">
                            <div class="multa">
                                <div>
                                    <span class="titulo">Multa</span>
                                </div>
                                <span>R$ {$guia['retornoMulta']}</span>
                            </div>
                        </div>
                        <div class="info-10">
                            <div class="total-recolher">
                                <div>
                                    <span class="titulo">Total a Recolher</span>
                                </div>
                                <span>R$ {$guia['_valorGNRE']}</span> {*valorTotal*}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="guia-rodape">
                    <div class="codigo-barras">
                        <span>
                            <b style="padding-left:120px">{$guia['retornoRepresentacaoNumerica']}</b>
                        </span>
                        <div>
                            <img src="data:image/jpeg;base64,{$barcode->getCodigoBarrasBase64()}"/>
                        </div>
                    </div>
                    <div class="via">
                        <span>{$via}</span>
                    </div>
                    <div class="clear"></div>
                </div>
                <span>---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</span>
            </div>
        {/foreach}
    </body>
</html>
