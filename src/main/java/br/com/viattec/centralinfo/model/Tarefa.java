package br.com.viattec.centralinfo.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Tarefa {
	@Id
	@SequenceGenerator(name = "tarefa_id", sequenceName = "tarefa_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "tarefa_id")
	private Long id;
	@Temporal(value=TemporalType.DATE)
	private Date dataAbertura;
	@Temporal(value=TemporalType.TIME)
	private Date horaAbertura;
	@Temporal(value=TemporalType.DATE)
	private Date dataPrevistaEncerramento;
	@Temporal(value=TemporalType.TIMESTAMP)
	private Date dataEncerramento;
	@NotNull
	@NotEmpty
	private String titulo;
	@Column(columnDefinition="text")
	private String descricao;
	@ManyToOne
	private Colaborador colaboradorCriador;
	@NotNull
	@ManyToOne
	private Colaborador colaboradorExecutor;
	@ManyToOne(optional = true)
	@JoinColumn(nullable = true, name="colaboradorgestor_id", columnDefinition="integer")
	private Colaborador colaboradorGestor;
	private String tag;
	private String status;
	@ManyToMany
	@JoinTable(name="tarefa_seguidor", joinColumns={@JoinColumn(name="tarefa_id")})
	private List<Colaborador> seguidores = new ArrayList<Colaborador>();
	@OneToMany
	private List<Arquivo> arquivos = new ArrayList<Arquivo>();


	public Tarefa(){
		
	}
	
	public Tarefa(Long id, Date dataAbertura, Date horaAbertura,
			Date dataPrevistaEncerramento, Date dataEncerramento,
			String titulo, String descricao, Colaborador colaboradorCriador,
			Colaborador colaboradorExecutor, Colaborador colaboradorGestor,
			String tag, String status, List<Colaborador> seguidores) {
		super();
		this.id = id;
		this.dataAbertura = dataAbertura;
		this.horaAbertura = horaAbertura;
		this.dataPrevistaEncerramento = dataPrevistaEncerramento;
		this.dataEncerramento = dataEncerramento;
		this.titulo = titulo;
		this.descricao = descricao;
		this.colaboradorCriador = colaboradorCriador;
		this.colaboradorExecutor = colaboradorExecutor;
		this.colaboradorGestor = colaboradorGestor;
		this.tag = tag;
		this.status = status;
		this.seguidores = seguidores;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getDataAbertura() {
		return dataAbertura;
	}
	public void setDataAbertura(Date dataAbertura) {
		this.dataAbertura = dataAbertura;
	}
	public Date getHoraAbertura() {
		return horaAbertura;
	}
	public void setHoraAbertura(Date horaAbertura) {
		this.horaAbertura = horaAbertura;
	}
	public Date getDataPrevistaEncerramento() {
		return dataPrevistaEncerramento;
	}
	public void setDataPrevistaEncerramento(Date dataPrevistaEncerramento) {
		this.dataPrevistaEncerramento = dataPrevistaEncerramento;
	}
	public Date getDataEncerramento() {
		return dataEncerramento;
	}
	public void setDataEncerramento(Date dataEncerramento) {
		this.dataEncerramento = dataEncerramento;
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
	public Colaborador getColaboradorCriador() {
		return colaboradorCriador;
	}
	public void setColaboradorCriador(Colaborador colaboradorCriador) {
		this.colaboradorCriador = colaboradorCriador;
	}
	public Colaborador getColaboradorExecutor() {
		return colaboradorExecutor;
	}
	public void setColaboradorExecutor(Colaborador colaboradorExecutor) {
		this.colaboradorExecutor = colaboradorExecutor;
	}
	public Colaborador getColaboradorGestor() {
		return colaboradorGestor;
	}
	public void setColaboradorGestor(Colaborador colaboradorGestor) {
		this.colaboradorGestor = colaboradorGestor;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<Colaborador> getSeguidores() {
		return seguidores;
	}
	public void setSeguidores(List<Colaborador> seguidores) {
		this.seguidores = seguidores;
	}

	public List<Arquivo> getArquivos() {
		return arquivos;
	}

	public void setArquivos(List<Arquivo> arquivos) {
		this.arquivos = arquivos;
	}
}
