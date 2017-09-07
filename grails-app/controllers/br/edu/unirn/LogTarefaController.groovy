package br.edu.unirn

class LogTarefaController {

    static scaffold = LogTarefa


    def save(LogTarefa log, Tarefa tarefa){
        if(!log.save(flush: true) || !tarefa.save(flush: true)){
            log.errors.each {println it}
            tarefa.errors.each {println it}
            render status: 500
            return
        }

        render status: 200
    }
}
