package com.project3.placestation.service;

import java.util.ArrayList;
import java.util.List;

import org.h2.mvstore.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.project3.placestation.biz.handler.exception.CustomRestfulException;
import com.project3.placestation.product.dto.ProdReviewDto;
import com.project3.placestation.repository.entity.ProdReview;
import com.project3.placestation.repository.interfaces.ProdReviewRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProdReviewService {

	@Autowired
	ProdReviewRepository prodReviewRepository;

    // 상품 별 리뷰를 페이징하여 조회
	public List<ProdReviewDto> findReviews(int prodNo, int offset, int reviewsPerPage) {

	    List<ProdReview> prodReviews = prodReviewRepository.findReviews(prodNo, offset, reviewsPerPage);
	    List<ProdReviewDto> dtos = new ArrayList<>();

	    for (ProdReview prodRev : prodReviews) {
	        ProdReviewDto dto = ProdReviewDto.builder()
	            .prodRevNo(prodRev.getProdRevNo())
	            .prodNo(prodRev.getProdNo())
	            .prodRevContent(prodRev.getProdRevContent())
	            .prodRevStar(prodRev.getProdRevStar())
	            .prodRevCreateAt(prodRev.getProdRevCreateAt())
	            .userNo(prodRev.getUserNo())
	            .userName(prodRev.getUserName())
	            .prodRevUpdateAt(prodRev.getProdRevUpdateAt())
	            .prodRevDeleteYn(prodRev.getProdRevDeleteYn())
	            .prodRevDeleteAt(prodRev.getProdRevDeleteAt())
	            .parentId(prodRev.getParentId())
	            .filePath(prodRev.getFilePath())
	            .build();
	        
	        dtos.add(dto);
	    }

	    return dtos;
	}
	
	// 답글 등록 

    public void saveReview(ProdReviewDto dto) {
        
        ProdReview prodReview = ProdReview.builder()
                .prodNo(dto.getProdNo())
                .prodRevContent(dto.getProdRevContent())
                .prodRevStar(dto.getProdRevStar())
                .userNo(dto.getUserNo())
                .parentId(dto.getParentId())
                .build();
        
        int result = prodReviewRepository.saveReview(prodReview);
		// 확인
		if (result < 1) {
			throw new CustomRestfulException("답글 등록에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
    }
	// 리뷰 등록 
    public void addReview(ProdReviewDto dto) {
        
        ProdReview prodReview = ProdReview.builder()
                .prodNo(dto.getProdNo())
                .prodRevContent(dto.getProdRevContent())
                .prodRevStar(dto.getProdRevStar())
                .userNo(dto.getUserNo())
                .parentId(dto.getParentId())
                .build();
        

        int result = prodReviewRepository.addReview(prodReview);

		// 확인
		if (result < 1) {
			throw new CustomRestfulException("리뷰 등록에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
    }


    // 리뷰 삭제
    @Transactional
    public void deleteReview(Integer prodRevNo) {
        int result = prodReviewRepository.deleteReview(prodRevNo);
        if (result < 1) {
            throw new CustomRestfulException("리뷰 삭제에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 리뷰 개수 count
    public Integer getCountReview(Integer prodNo) {
    	return prodReviewRepository.countReview(prodNo);
    }
    
    public Double getAvgStar(Integer prodNo) {
    	Double avgStar = prodReviewRepository.avgStar(prodNo);
        return avgStar != null ? avgStar : 0;
    }

    // 답글 목록을 가져오는 메서드
    public List<ProdReviewDto> findReplies(Integer prodNo) {
        List<ProdReview> replies = prodReviewRepository.findReplies(prodNo);
        List<ProdReviewDto> replyDtos = new ArrayList<>();

        // 답글 엔티티를 DTO로 변환
        for (ProdReview reply : replies) {
            ProdReviewDto replyDto = ProdReviewDto.builder()
                .prodRevNo(reply.getProdRevNo())
                .prodNo(reply.getProdNo())
                .prodRevContent(reply.getProdRevContent())
                .prodRevStar(reply.getProdRevStar())
                .prodRevCreateAt(reply.getProdRevCreateAt())
                .userNo(reply.getUserNo())
                .prodRevUpdateAt(reply.getProdRevUpdateAt())
                .prodRevDeleteYn(reply.getProdRevDeleteYn())
                .prodRevDeleteAt(reply.getProdRevDeleteAt())
                .parentId(reply.getParentId())
                .userName(reply.getUserName())
                .filePath(reply.getFilePath())
                .build();
            
            replyDtos.add(replyDto);
        }

        return replyDtos;
    }

}
