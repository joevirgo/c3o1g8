package cicloO3.proyectosprint3.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/hello")
    public String Hello(){
        return "Hola";
    }
/*     public ResponseEntity<String> Hello(){
        return new ResponseEntity<String>("Hola", HttpStatus.OK);
    } */
}
