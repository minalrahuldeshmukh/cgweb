package com.cg.domain;

import com.cg.domain.DataSet;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ResponseBodyWrapper implements Serializable {
    List<DataSet> dataSetList= new ArrayList();
    String status ;

    public List<DataSet> getDataSetList() {
        return dataSetList;
    }

    public void setDataSetList(List<DataSet> dataSetList) {
        this.dataSetList = dataSetList;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
