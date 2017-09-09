package br.edu.unirn

import grails.converters.JSON

class TarefaController {

    static scaffold = Tarefa

    def index(){}

    def save(){
        params << request.JSON
        Tarefa tarefa = new Tarefa()
        bindData(tarefa, params, [exclude:['dataLimite']])
        tarefa.dataLimite = params.date('dataLimite', 'dd/MM/yyyy')

        if(!tarefa.save(flush: true)){
            tarefa.errors.each {println it}
            render status: 500
            return
        }

        render status: 200
    }

    def saveLogTarefa(){
        params << request.JSON
        LogTarefa log = new LogTarefa()
        bindData(log, params)
        Date novaData = new Date()
        log.dateCreated = novaData
        log.lastUpdated = novaData
        log.tarefa.usuarioAbertura = Usuario.findWhere(email: log.tarefa.usuarioAbertura.email)
        log.tarefa.usuarioResponsavel = Usuario.findWhere(email: log.tarefa.usuarioResponsavel.email)
        log.tarefa.tipoTarefa = TipoTarefa.findWhere(descricao: log.tarefa.tipoTarefa.descricao)
        Tarefa tarefa = Tarefa.findWhere(id:  log.tarefa.id)
        tarefa.porcentagem = log.porcentagem
        tarefa.statusTarefa = log.statusTarefa
        log.tarefa = tarefa

        if(!log.save(flush: true) || !tarefa.save(flush: true)){
            log.errors.each {println it}
            tarefa.errors.each {println it}
            render status: 500
            return
        }

        render status: 200
    }

    def show(){
        Tarefa tarefa = Tarefa.get(params.id)
        render([
                id: tarefa.id,
                titulo: tarefa.titulo,
                texto: tarefa.texto,
                usuarioAbertura: tarefa.usuarioAbertura.id,
                usuarioResponsavel: tarefa.usuarioResponsavel?.id,
                dataLimite: tarefa.dataLimite.format("dd/MM/yyyy"),
                tipoTarefa: tarefa.tipoTarefa.id,
                statusTarefa: tarefa.statusTarefa.name(),
                porcentagem: tarefa.porcentagem
        ] as JSON)
    }

    def showTarefaLog(){
        Tarefa tarefa = Tarefa.get(params.id)
        render([
                id: tarefa.id,
                titulo: tarefa.titulo,
                texto: tarefa.texto,
                usuarioAbertura: tarefa.usuarioAbertura,
                usuarioResponsavel: tarefa.usuarioResponsavel,
                dataLimite: tarefa.dataLimite.format("dd/MM/yyyy"),
                tipoTarefa: tarefa.tipoTarefa,
                statusTarefa: tarefa.statusTarefa.descricao,
                porcentagem: tarefa.porcentagem
        ] as JSON)
    }

    def list(){
        def retorno = []

        Tarefa.list().each {
            retorno.add([
                id: it.id,
                titulo: it.titulo,
                usuarioAbertura: it.usuarioAbertura.email,
                usuarioResponsavel: it.usuarioResponsavel?.email,
                dataLimite: it.dataLimite.format("dd/MM/yyyy"),
                tipoTarefa: it.tipoTarefa.descricao,
                statusTarefa: it.statusTarefa.name(),
                porcentagem: it.porcentagem
            ])
        }

        render retorno as JSON
    }

    def update(){
        params << request.JSON
        Tarefa tarefa = Tarefa.get(params.id)

        bindData(tarefa, params, [exclude:['dataLimite']])
        tarefa.dataLimite = params.date('dataLimite', 'dd/MM/yyyy')

        if(!tarefa.save(flush: true)){
            render status: 500
            return
        }

        render status: 200
    }
}
