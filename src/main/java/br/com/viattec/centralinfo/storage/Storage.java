package br.com.viattec.centralinfo.storage;

import java.io.IOException;
import java.net.URI;

import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.viattec.centralinfo.model.Arquivo;

public interface Storage {

	void write(UploadedFile file, String path) throws IOException;
	Arquivo recupera(URI chave);

}
