package com.bangsoft.apiserver.service;

import org.springframework.http.ResponseEntity;

import com.bangsoft.apiserver.dto.request.board.PostBoardRequestDto;
import com.bangsoft.apiserver.dto.response.board.PostBoardResponseDto;

public interface BoardService {
    ResponseEntity<? super PostBoardResponseDto> postBoard(PostBoardRequestDto dto, String email);    
}
