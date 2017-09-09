var tarefa = new Vue({
    el: '#tarefa',
    data: {
        tarefas: [],
        tarefa: {},
        log: {},
        logs: {},
        loading: false
    },
    methods: {
        getTarefas: function(){
            this.loading = true;
            this.$http.get(window.baseUrl+"tarefa/list/").then(function(resp){
                this.tarefas = resp.data;
                this.loading = false;
            }, function(err){
                this.loading = false;
            })
        },
        novaTarefa: function(){
            this.tarefa = {};
            $("#formTarefa").modal('show');
        },
        salvarTarefa: function(){
            this.$http.post(window.baseUrl+"tarefa/save", this.tarefa).then(function(resp){
                this.getTarefas();
                $("#formTarefa").modal('hide');
                this.tarefa = {};
            }, function(error){
                console.info(error)
            })
        },
        editTarefa: function(tarefa){
            this.$http.get(window.baseUrl+"tarefa/show/"+tarefa.id).then(function(resp){
                this.tarefa = resp.data;
                $("#formTarefa").modal('show');
            }, function(resp){
            })
        },
        novoLog: function(tarefa){
            this.$http.get(window.baseUrl+"tarefa/showTarefaLog/"+tarefa.id).then(function(resp){
                this.tarefa = resp.data;
                this.log = {};
                this.log.tarefa = {};
                this.log.tarefa.id = this.tarefa.id;
                $("#formLog").modal('show');
            }, function(resp){
            })
        },
        salvarLog: function(){
            this.$http.post(window.baseUrl+"tarefa/saveLogTarefa", this.log).then(function(resp){
                $("#formLog").modal('hide');
                this.log = {};
            }, function(error){
                console.info(error)
            })
        },
        updateTarefa: function(){
            this.$http.put(window.baseUrl+"tarefa/update/"+this.tarefa.id, this.tarefa).then(function(resp){
                this.getTarefas();
                $("#formTarefa").modal('hide');
                this.tarefa = {};
            }, function(resp){
            })
        }
    },
    ready: function(){
        this.getTarefas();
    }
});