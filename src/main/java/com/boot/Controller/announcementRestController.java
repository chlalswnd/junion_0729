package com.boot.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.boot.DTO.announcementsBoardDTO;
import com.boot.Service.announcementsBoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping
public class announcementRestController {

    @Autowired
    private announcementsBoardService boardService;

    @ResponseBody
    @RequestMapping(value=("/api"), method = RequestMethod.GET)
    public Map getlist() {
        List<announcementsBoardDTO> announcements = boardService.boardList();
        Map result = new HashMap();
        result.put("result", Boolean.TRUE);
        result.put("data", announcements);
        return result;
    }

//    @GetMapping("/{board_no}")
//    public ResponseEntity<announcementsBoardDTO> getAnnouncementById(@PathVariable int board_no) {
//        announcementsBoardDTO announcement = boardService.findByBoardno(board_no);
//        if (announcement != null) {
//            return ResponseEntity.ok(announcement);
//        } else {
//            return ResponseEntity.notFound().build();
//        }
//    }
}












