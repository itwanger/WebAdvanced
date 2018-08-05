package com.cmower.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmower.database.entity.Votes;
import com.cmower.database.mapper.VoteMapper;

@Service
public class VoteService {
	@Autowired
	private VoteMapper voteMapper;
	
	public void insert(Votes param) {
		param.preInsert();
		this.voteMapper.insert(param);
	}

	public long updateSelective(Votes param) {
		if (param.getId() == null) {
			throw new RuntimeException("更新数据时ID未赋值");
		}

		param.preUpdate();
		return this.voteMapper.updateSelective(param);
	}


	public List<Votes> selectList(Votes param) {
		return this.voteMapper.selectList(param);
	}

}
