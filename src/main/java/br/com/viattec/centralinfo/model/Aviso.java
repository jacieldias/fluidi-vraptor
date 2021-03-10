package br.com.viattec.centralinfo.model;

import java.util.Date;

import javax.persistence.Column;
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
public class Aviso {
	
	@Id
	@SequenceGenerator(name = "aviso_id", sequenceName = "aviso_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "aviso_id")
	private Long id;
	@NotNull
	@Temporal(value=TemporalType.DATE)
	private Date dataCriacao;
	@NotNull
	@NotEmpty
	@Column(columnDefinition="text")
	private String conteudo;
	@NotNull
	@ManyToOne
	private Colaborador colaborador;
		
	public Aviso(Long id, Date dataCriacao, String conteudo,
			Colaborador colaborador) {
		super();
		this.id = id;
		this.dataCriacao = dataCriacao;
		this.conteudo = conteudo;
		this.colaborador = colaborador;
	}

	public Aviso(){
		
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

	public String getConteudo() {
		return conteudo;
	}

	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}
}
