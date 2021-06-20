package bu.mvc.respsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import bu.mvc.domain.Price;

public interface PriceRepository extends JpaRepository<Price, Long> {

	/**
	 * 상담사 코드와 상담필드로 상담권 가격 정보 찾아오기 - 김동현이 작성함
	 * */
	Price findByCounselorCounselorCodeAndCounselorField(Long counselorCode, int counselorField);
}
