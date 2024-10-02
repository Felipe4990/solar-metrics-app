package br.com.univesp.solar.service;

import br.com.univesp.solar.model.Solar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SolarRepository extends JpaRepository<Solar, Long> {

}
