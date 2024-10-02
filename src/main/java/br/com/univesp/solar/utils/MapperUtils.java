package br.com.univesp.solar.utils;

import br.com.univesp.solar.model.dto.SolarDTO;
import org.modelmapper.ModelMapper;

public class MapperUtils {

    public SolarDTO convertToDto(Object obj, SolarDTO mapper) {
        return new ModelMapper().map(obj, mapper.getClass());
    }

    public Object convertToEntity(Object obj, SolarDTO mapper) {
        return new ModelMapper().map(mapper, obj.getClass());
    }

}
