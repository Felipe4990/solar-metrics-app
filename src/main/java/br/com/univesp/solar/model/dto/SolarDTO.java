package br.com.univesp.solar.model.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SolarDTO {

    private String name;

    private ConsumptionDTO consumption;
}
