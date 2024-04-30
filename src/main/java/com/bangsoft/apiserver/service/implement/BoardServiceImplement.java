package com.bangsoft.apiserver.service.implement;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.bangsoft.apiserver.dto.request.board.PostBoardRequestDto;
import com.bangsoft.apiserver.dto.response.ResponseDto;
import com.bangsoft.apiserver.dto.response.board.PostBoardResponseDto;
import com.bangsoft.apiserver.entity.BoardEntiy;
import com.bangsoft.apiserver.entity.ImageEntity;
import com.bangsoft.apiserver.repository.BoardRepository;
import com.bangsoft.apiserver.repository.ImageRepository;
import com.bangsoft.apiserver.repository.UserRepository;
import com.bangsoft.apiserver.service.BoardService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImplement implements BoardService{

    private final UserRepository userRepository;
    private final BoardRepository boardRepository;
    private final ImageRepository imageRepository;

    @Override
    public ResponseEntity<? super PostBoardResponseDto> postBoard(PostBoardRequestDto dto, String email) {
        try {
            boolean existedEmail = userRepository.existsByEmail(email);
            if(!existedEmail) return PostBoardResponseDto.notExistUser(); 

            BoardEntiy boardEntiy = new BoardEntiy(dto, email);
            boardRepository.save(boardEntiy);

            int boardNumber = boardEntiy.getBoardNumber();
            List<String> boardImageList = dto.getBoardImageList();
            List<ImageEntity> imageEntities = new ArrayList<>();

            for(String image : boardImageList){
                ImageEntity imageEntity = new ImageEntity(boardNumber, image);
                imageEntities.add(imageEntity);
            }

            imageRepository.saveAll(imageEntities);
            
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseDto.databaseError();
        }

        return PostBoardResponseDto.success();
    }
    
}
