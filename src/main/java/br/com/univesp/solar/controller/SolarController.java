package br.com.univesp.solar.controller;

import br.com.univesp.solar.service.SolarService;
import br.com.univesp.solar.model.dto.SolarDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/")
public class SolarController {

    private final SolarService updateService;

    @Autowired
    public SolarController(SolarService updateService){
        this.updateService = updateService;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public SolarDTO createPost(@RequestBody SolarDTO userCreateDTO) {
        return updateService.createUser(userCreateDTO);
    }

}
