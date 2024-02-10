package com.app.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.app.web.service.usuarioService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.app.web.dto.usuarioDTO;

@RestController
@RequestMapping
public class Controller {
	
	@Autowired
	private usuarioService usuarioService;
	
	@GetMapping("/listar")
	public List<usuarioDTO> getServicio() throws JsonMappingException, JsonProcessingException{
		return usuarioService.getAllusers();
	}
	
	@GetMapping("/lista")
	public ModelAndView listar() throws JsonMappingException, JsonProcessingException{
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}
	
	@PostMapping("/crear")
    public ResponseEntity<String> guardar(@RequestBody usuarioDTO user) {
	        return usuarioService.saveUser(user);
    }
	
	@GetMapping("/crea")
	public ModelAndView crea(){
		ModelAndView modelAndView = new ModelAndView("form");
		return modelAndView;
	}
}
