package br.com.viattec.centralinfo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

@Entity(name = "demanda_status")
public class StatusDemanda {

	@Id
	@SequenceGenerator(name = "demanda_status_id", sequenceName = "demanda_status_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "demanda_status_id")	
	private Long id;
	@NotNull
	private String descricao;
	private String cor;
	
	public StatusDemanda(Long id, String descricao, String cor) {
		super();
		this.id = id;
		this.descricao = descricao;
		this.cor = cor;
	}
	
	public StatusDemanda(){
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}
}
