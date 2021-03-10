package br.com.viattec.centralinfo.model;

public enum StatusTarefa {
	PENDENTE("PENDENTE"),
	EXECUTANDO("EM ANDAMENTO"),
	FINALIZADA("FINALIZADA");
	
	private String label;
	
	private StatusTarefa(String label){
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}
}
