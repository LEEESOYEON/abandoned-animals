package com.ani.service;

import java.util.HashMap;
import java.util.List;

import com.ani.vo.LikeVO;

public interface IF_likeService {
	public void insert(LikeVO vo);
	public List<LikeVO> selectList(String mid);
	public int selectCont(HashMap<String, String> params);
	public void deleteLike(String likeNo);
}
