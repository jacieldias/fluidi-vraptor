package br.com.viattec.centralinfo.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Canal {

	@Id
	@SequenceGenerator(name = "canal_id", sequenceName = "canal_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "canal_id")	
	private Long id;
	@NotEmpty
	private String nome;
	private String finalidade;
	private String visibilidade;
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCriacao;
	@ManyToMany
	private List<Colaborador> colaboradores;
	
	public Canal(){
		
	}

	public Canal(Long id, String nome, String finalidade, String visibilidade,
			Date dataCriacao, List<Colaborador> colaboradores) {
		super();
		this.id = id;
		this.nome = nome;
		this.finalidade = finalidade;
		this.visibilidade = visibilidade;
		this.dataCriacao = dataCriacao;
		this.colaboradores = colaboradores;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getFinalidade() {
		return finalidade;
	}

	public void setFinalidade(String finalidade) {
		this.finalidade = finalidade;
	}

	public String getVisibilidade() {
		return visibilidade;
	}

	public void setVisibilidade(String visibilidade) {
		this.visibilidade = visibilidade;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public List<Colaborador> getColaboradores() {
		return colaboradores;
	}

	public void setColaboradores(List<Colaborador> colaboradores) {
		this.colaboradores = colaboradores;
	}
}
