package br.com.viattec.centralinfo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

@Entity
public class EtapaWorkflow {
	
	@Id
	@SequenceGenerator(name = "etapa_workflow_id", sequenceName = "etapa_workflow_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "etapa_workflow_id")
	private Long id;
	@NotNull
	private String descricao;
	@NotNull
	private int posicao;
	
	public EtapaWorkflow(Long id, String descricao, int posicao) {
		super();
		this.id = id;
		this.descricao = descricao;
		this.posicao = posicao;
	}
	
	public EtapaWorkflow() {

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

	public int getPosicao() {
		return posicao;
	}

	public void setPosicao(int posicao) {
		this.posicao = posicao;
	}
}
