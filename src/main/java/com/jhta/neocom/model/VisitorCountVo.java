package com.jhta.neocom.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VisitorCountVo {
    private int visit_id;
    private String visit_ip;
    private Date visit_time;
    private String visit_refer;
    private String visit_agent;
}