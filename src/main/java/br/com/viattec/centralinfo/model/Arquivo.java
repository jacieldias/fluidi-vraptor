package br.com.viattec.centralinfo.model;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class Arquivo {
	
	@Id
	@SequenceGenerator(name = "arquivo_id", sequenceName = "arquivo_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "arquivo_id")
	private Long id;
	private String nome;
	private String contentType;
	private Calendar dataModificacao;
	private String path;
	
	public Arquivo(Long id, String nome, String contentType,
			Calendar dataModificacao, String path) {
		super();
		this.id = id;
		this.nome = nome;
		this.contentType = contentType;
		this.dataModificacao = dataModificacao;
		this.path = path;
	}

	public Arquivo(){
		
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
	
	public String getContentType() {
		return contentType;
	}
	
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	public Calendar getDataModificacao() {
		return dataModificacao;
	}
	
	public void setDataModificacao(Calendar dataModificacao) {
		this.dataModificacao = dataModificacao;
	}


	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}
