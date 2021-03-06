package com.symbol.app.mantoeye.entity.business;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * FtbBusinessMainVetor entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ftbBusinessMainVetor", schema = "DBA", catalog = "iqwrite")
public class FtbBusinessMainVetor implements java.io.Serializable {

	// Fields

	private Integer nmBusinessMainVetorId;
	private DtbBusinessSite dtbBusinessSite;
	private String vcServerIp;
	private Integer intPort;
	private String vcUrl;
	private String vcUserAgent;
	private String vcApn;
	private Set<FtbMainAssistVetor> ftbMainAssistVetors = new HashSet<FtbMainAssistVetor>();

	// Constructors

	/** default constructor */
	public FtbBusinessMainVetor() {
	}

	/** full constructor */
	public FtbBusinessMainVetor(DtbBusinessSite dtbBusinessSite,
			String vcServerIp, Integer intPort, String vcUrl,
			String vcUserAgent, String vcApn,
			Set<FtbMainAssistVetor> ftbMainAssistVetors) {
		this.dtbBusinessSite = dtbBusinessSite;
		this.vcServerIp = vcServerIp;
		this.intPort = intPort;
		this.vcUrl = vcUrl;
		this.vcUserAgent = vcUserAgent;
		this.vcApn = vcApn;
		this.ftbMainAssistVetors = ftbMainAssistVetors;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "nmBusinessMainVetorId", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getNmBusinessMainVetorId() {
		return this.nmBusinessMainVetorId;
	}

	public void setNmBusinessMainVetorId(Integer nmBusinessMainVetorId) {
		this.nmBusinessMainVetorId = nmBusinessMainVetorId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "nmBussinessId")
	public DtbBusinessSite getDtbBusinessSite() {
		return this.dtbBusinessSite;
	}

	public void setDtbBusinessSite(DtbBusinessSite dtbBusinessSite) {
		this.dtbBusinessSite = dtbBusinessSite;
	}

	@Column(name = "vcServerIp", length = 20)
	public String getVcServerIp() {
		return this.vcServerIp;
	}

	public void setVcServerIp(String vcServerIp) {
		this.vcServerIp = vcServerIp;
	}

	@Column(name = "intPort")
	public Integer getIntPort() {
		return this.intPort;
	}

	public void setIntPort(Integer intPort) {
		this.intPort = intPort;
	}

	@Column(name = "vcUrl", length = 100)
	public String getVcUrl() {
		return this.vcUrl;
	}

	public void setVcUrl(String vcUrl) {
		this.vcUrl = vcUrl;
	}

	@Column(name = "vcUserAgent", length = 50)
	public String getVcUserAgent() {
		return this.vcUserAgent;
	}

	public void setVcUserAgent(String vcUserAgent) {
		this.vcUserAgent = vcUserAgent;
	}

	@Column(name = "vcApn", length = 50)
	public String getVcApn() {
		return this.vcApn;
	}

	public void setVcApn(String vcApn) {
		this.vcApn = vcApn;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "ftbBusinessMainVetor")
	public Set<FtbMainAssistVetor> getFtbMainAssistVetors() {
		return this.ftbMainAssistVetors;
	}

	public void setFtbMainAssistVetors(
			Set<FtbMainAssistVetor> ftbMainAssistVetors) {
		this.ftbMainAssistVetors = ftbMainAssistVetors;
	}

}