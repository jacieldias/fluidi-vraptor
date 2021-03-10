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
public class Norma {
	
	@Id
	@SequenceGenerator(name = "norma_id", sequenceName = "norma_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "norma_id")
	private Long id;
	@Temporal(value=TemporalType.DATE)
	private Date dataCriacao;
	@NotNull
	@NotEmpty
	private String titulo;
	@NotNull
	@NotEmpty
	@Column(columnDefinition="text")
	private String descricao;
	@ManyToOne
	private Setor setor;
	@NotNull
	@ManyToOne
	private Colaborador colaborador;
	
	public Norma(){
		
	}

	public Norma(Long id, Date dataCriacao, String titulo, String descricao,
			Setor setor, Colaborador colaborador) {
		super();
		this.id = id;
		this.dataCriacao = dataCriacao;
		this.titulo = titulo;
		this.descricao = descricao;
		this.setor = setor;
		this.colaborador = colaborador;
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

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Setor getSetor() {
		return setor;
	}

	public void setSetor(Setor setor) {
		this.setor = setor;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}
}
