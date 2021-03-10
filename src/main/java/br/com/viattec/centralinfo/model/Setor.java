package br.com.viattec.centralinfo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Setor {

	@Id
	@SequenceGenerator(name = "setor_id", sequenceName = "setor_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "setor_id")
	private int id;
	@NotNull
	@NotEmpty
	private String descricao;

	public Setor(int id, String descricao) {
		super();
		this.id = id;
		this.descricao = descricao;
	}

	public Setor() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
