package cicloO3.proyectosprint3.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cicloO3.proyectosprint3.entity.Perfil;
import cicloO3.proyectosprint3.repository.PerfilRepository;

@Service
public class PerfilService {
    @Autowired
    PerfilRepository repository;

    public Perfil createNewPerfil(Perfil perfil) {
        return repository.save(perfil);
    }

    public void deletePerfil(long id) {
        repository.deleteById(id);
    }
}
