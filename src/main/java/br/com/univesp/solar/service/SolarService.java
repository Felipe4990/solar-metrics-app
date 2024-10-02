package br.com.univesp.solar.service;

import br.com.univesp.solar.model.Solar;
import br.com.univesp.solar.model.dto.SolarDTO;
import br.com.univesp.solar.utils.MapperUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SolarService {

    @Autowired
    private SolarRepository solarRepository;

    public SolarDTO createUser(SolarDTO userCreateDto){
        // DTO to Entity
        Solar user = (Solar) new MapperUtils().convertToEntity(new Solar(), userCreateDto);

        // Save to DB
        solarRepository.save(user);

        //Entity to DTO
        return new MapperUtils().convertToDto(user, new SolarDTO());

    }
}
