<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="tarefa" v-cloak="">
            <ol class="breadcrumb">
                <li><a href="${createLink(uri: '/')}">Inicio</a></li>
                <li class="active">Tarefa</li>
            </ol>

            <div class="panel panel-default">
                <div class="panel-heading"><g:message code="default.list.label" args="[entityName]" /></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <button class="btn btn-success pull-right" @click="novaTarefa">
                                Nova Tarefa
                            </button>
                        </div>
                        <div class="col-sm-12">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Titulo</th>
                                        <th>Usuario Abertura</th>
                                        <th>Usuario Resp.</th>
                                        <th>Data Limite</th>
                                        <th>Tipo Tarefa</th>
                                        <th>Status</th>
                                        <th>%</th>
                                        <th>
                                            Add Log
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr v-if="loading">
                                    <td colspan="7">Carregando....</td>
                                </tr>
                                <tr v-for="tarefa in tarefas" :key="tarefa.id">
                                    <td><a href="javascript:void(0);" @click="editTarefa(tarefa)">{{tarefa.titulo}}</a></td>
                                    <td>{{tarefa.usuarioAbertura}}</td>
                                    <td>{{tarefa.usuarioResponsavel}}</td>
                                    <td>{{tarefa.dataLimite}}</td>
                                    <td>{{tarefa.tipoTarefa}}</td>
                                    <td>{{tarefa.statusTarefa}}</td>
                                    <td>{{tarefa.porcentagem}}</td>
                                    <td>
                                        <button class="btn btn-success pull-right" @click="novoLog(tarefa)">
                                            Novo Log
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>


                </div>
            </div>


            <div class="modal fade" tabindex="-1" role="dialog" id="formTarefa">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Nova Tarefa</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <g:render template="form"/>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary" @click="salvarTarefa" v-if="!tarefa.id"><i class="fa fa-floppy-o"></i> Salvar Tarefa</button>
                            <button type="button" class="btn btn-primary" @click="updateTarefa" v-if="tarefa.id"><i class="fa fa-floppy-o"></i> Alterar Tarefa</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" tabindex="-1" role="dialog" id="formLog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Tarefa Associada</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <g:render template="formLogTarefa"/>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary" @click="salvarLog"><i class="fa fa-floppy-o"></i>Cadastrar Log</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    <content tag="javascript">
        <asset:javascript src="controllers/tarefa.js"/>
    </content>
    </body>
</html>