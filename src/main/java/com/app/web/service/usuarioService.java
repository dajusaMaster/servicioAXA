package com.app.web.service;

import org.springframework.stereotype.Service;

import org.springframework.http.HttpHeaders;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.app.web.dto.usuarioDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class usuarioService {
	
	@Autowired
	private RestTemplate restTemplate;
	final String url="https://8e7c6b8a-fc46-4674-a529-4ebec57295d3.mock.pstmn.io/customers";
	
	public List<usuarioDTO> getAllusers() throws JsonMappingException, JsonProcessingException{
		
		try {
	        String response = restTemplate.getForObject(url, String.class);
	        ObjectMapper mapper = new ObjectMapper();
	        
	        response = response.replaceAll("“", "\"").replaceAll("”", "\"");
	        
            List<usuarioDTO> usuarios = mapper.readValue(response, mapper.getTypeFactory().constructCollectionType(List.class, usuarioDTO.class));

	        return usuarios;
	    } catch (RestClientException e) {
	        throw new RuntimeException("Error al obtener datos del servicio externo", e);
	    }
	}
	
	public ResponseEntity<String> saveUser(usuarioDTO user) {
		ResponseEntity<String> response = restTemplate.postForEntity(url, user, String.class);
		return response;
    }
}
