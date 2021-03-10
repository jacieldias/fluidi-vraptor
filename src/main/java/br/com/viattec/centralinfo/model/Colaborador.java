package br.com.viattec.centralinfo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Colaborador {

	@Id
	@SequenceGenerator(name = "colaborador_id", sequenceName = "colaborador_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "colaborador_id")
	private Long id;
	@NotNull
	@NotEmpty
	private String nome;
	@NotNull
	@NotEmpty
	private String login;
	@NotNull
	@NotEmpty
	private String senha;
	@NotNull
	@NotEmpty
	private String confirmaSenha;
	private String email;
	@NotNull
	@NotEmpty
	private String tipoColaborador;
	@NotNull
	@ManyToOne
	private Setor setor;
	
	public Colaborador(Long id, String nome, String login, String senha,
			String confirmaSenha, String email, String tipoColaborador,
			Setor setor) {
		super();
		this.id = id;
		this.nome = nome;
		this.login = login;
		this.senha = senha;
		this.confirmaSenha = confirmaSenha;
		this.email = email;
		this.tipoColaborador = tipoColaborador;
		this.setor = setor;
	}

	public Colaborador(){
		
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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getConfirmaSenha() {
		return confirmaSenha;
	}

	public void setConfirmaSenha(String confirmaSenha) {
		this.confirmaSenha = confirmaSenha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTipoColaborador() {
		return tipoColaborador;
	}

	public void setTipoColaborador(String tipoColaborador) {
		this.tipoColaborador = tipoColaborador;
	}

	public Setor getSetor() {
		return setor;
	}

	public void setSetor(Setor setor) {
		this.setor = setor;
	}
}
