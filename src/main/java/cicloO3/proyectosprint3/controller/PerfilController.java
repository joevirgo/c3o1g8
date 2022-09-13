package cicloO3.proyectosprint3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cicloO3.proyectosprint3.entity.Perfil;
import cicloO3.proyectosprint3.service.PerfilService;

@RestController
@RequestMapping("perfil")
public class PerfilController {
    @Autowired
    PerfilService service;

    @PostMapping
    public ResponseEntity<Perfil> createPerfil(@RequestBody Perfil perfil) {
        Perfil createdPerfil = service.createNewPerfil(perfil);
        return new ResponseEntity(createdPerfil, HttpStatus.CREATED);
    }

    @DeleteMapping(path = "{id_perfil}")
    public ResponseEntity deletePerfil(@PathVariable("id_perfil") long id) {
        service.deletePerfil(id);
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }
}
