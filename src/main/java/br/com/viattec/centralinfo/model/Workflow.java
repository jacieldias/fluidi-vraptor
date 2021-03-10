package br.com.viattec.centralinfo.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

@Entity
public class Workflow {
	
	@Id
	@SequenceGenerator(name = "workflow_id", sequenceName = "workflow_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "workflow_id")
	private Long id;
	@NotNull
	private String nome;
	@OneToMany
	private List<EtapaWorkflow> etapas = new ArrayList<EtapaWorkflow>();
	

}
