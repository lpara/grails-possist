<%@ page import="br.edu.unirn.tipos.StatusTarefa" %>
<div class="form-group">
    <label for="titulo" class="col-sm-2 control-label">Titulo</label>
    <div class="col-sm-10">
        <g:field name="titulo" class="form-control" v-model="tarefa.titulo" readonly="true"/>
    </div>
</div>