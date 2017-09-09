<%@ page import="br.edu.unirn.tipos.StatusTarefa" %>
<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Log</th>
                        <th>Usuario Cadastro</th>
                        <th>Data Cadastro</th>
                        <th>Status Tarefa No Log</th>
                        <th>% do Log</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="log in logs" :key="log.id">
                        <td>{{log.texto}}</td>
                        <td>{{log.usuarioLog}}</td>
                        <td>{{log.dataCriacao}}</td>
                        <td>{{log.statusTarefa}}</td>
                        <td>{{log.porcentagem}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>