/*
 * Copyright 2012-2016 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cg.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.cg.domain.ArchivedRecord;
import com.cg.domain.ResponseBodyWrapper;
import com.cg.domain.DataSet;
import com.cg.domain.DataSetType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	@GetMapping("/")
	public String welcome(Map<String, Object> model) {
		return "home";
	}
	@ResponseBody
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ResponseBodyWrapper home(@RequestParam String datasetname) {
		ResponseBodyWrapper responseBodyWrapper = new ResponseBodyWrapper();
		responseBodyWrapper.setStatus("SUCCESS");

		ArchivedRecord archiveset = new ArchivedRecord();
		archiveset.setArchiveSystemId("1");
		archiveset.setDataSetName("TRADE");
		List<ArchivedRecord> archiveRecList   = new ArrayList<ArchivedRecord>();
		archiveRecList.add(archiveset);
		responseBodyWrapper.setArchiveRecList(archiveRecList);
		return responseBodyWrapper ;
	}
}
