package br.com.viattec.centralinfo.storage;

import java.io.File;
import java.io.IOException;
import java.net.URI;

import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.viattec.centralinfo.model.Arquivo;

public class StorageDirectory implements Storage {

	
	
	@Override
	public void write(UploadedFile file, String path) throws IOException {
		File arquivoASalvar = new File(path,file.getFileName());
		if(!arquivoASalvar.exists())
			arquivoASalvar.mkdir();
		file.writeTo(arquivoASalvar);
	}

	@Override
	public Arquivo recupera(URI chave) {
		// TODO Auto-generated method stub
		return null;
	}

}
