package br.com.viattec.centralinfo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class ComentarioTarefa {
	
	@Id
	@SequenceGenerator(name = "comentario_tarefa_id", sequenceName = "comentario_tarefa_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "comentario_tarefa_id")
	private Long id;
	@Temporal(value=TemporalType.TIMESTAMP)
	private Date dataCriacao;
	@NotNull
	@NotEmpty
	private String comentario;
	@ManyToOne
	@NotNull
	private Colaborador colaborador;
	@ManyToOne
	@NotNull
	private Tarefa tarefa;
	
	public ComentarioTarefa(){
		
	}

	public ComentarioTarefa(Long id, Date dataCriacao, String comentario,
			Colaborador colaborador, Tarefa tarefa) {
		super();
		this.id = id;
		this.dataCriacao = dataCriacao;
		this.comentario = comentario;
		this.colaborador = colaborador;
		this.tarefa = tarefa;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	public Tarefa getTarefa() {
		return tarefa;
	}

	public void setTarefa(Tarefa tarefa) {
		this.tarefa = tarefa;
	}
}
