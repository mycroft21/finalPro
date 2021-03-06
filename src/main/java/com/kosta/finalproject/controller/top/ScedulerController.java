package com.kosta.finalproject.controller.top;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.kosta.finalproject.dao.RRBoardDao;

@Controller
public class ScedulerController {
	@Autowired
	private RRBoardDao dao;

	// 스케줄러 셋팅 어노테이션 설정후 (CRON="초 분 시간 날짜 달 년)
	@Scheduled(cron = "0 0 12 * * *")
	public void seq_task() {
		dao.setRPBtask();
		dao.setRRtask();
	}
}