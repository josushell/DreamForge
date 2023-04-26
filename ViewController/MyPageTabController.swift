//
//  MyPageTabController.swift
//  GradutaionProject
//
//  Created by JOSUEYEON on 2023/04/25.
//

import UIKit

// MARK: - 마이 페이지 탭
class MyPageTabController: UIViewController {
    private let label_title = UILabel()
    private let tableView: UITableView = UITableView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpBase()
    }
    
    private func setUpBase() {
        self.view.addSubviews(label_title, tableView)
        
        label_title.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(11)
            make.leading.equalToSuperview().offset(23)
        }
        label_title.setTxtAttribute("마이페이지", size: 18, weight: .w600, txtColor: .black)

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registerCells()
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .white
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(label_title.snp.bottom).offset(11)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

extension MyPageTabController: UITableViewDataSource, UITableViewDelegate {
    private func registerCells() {
        self.tableView.register(ProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        self.tableView.register(MyPageCell.self, forCellReuseIdentifier: "MyPageCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "ProfileCell") ?? UITableViewCell()
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell") else { return UITableViewCell() }
            setCellAttribute(cell, title: "알림 설정", isSwitch: true)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell") else { return UITableViewCell() }
            self.setCellAttribute(cell, title: "개인 정보 보호", isSwitch: false)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell") else { return UITableViewCell() }
            self.setCellAttribute(cell, title: "로그아웃", isSwitch: false)
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell") else { return UITableViewCell() }
            self.setCellAttribute(cell, title: "회원 탈퇴", isSwitch: false, txtColor: .darkMain)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 185
        default:
            return 60
        }
    }
    
    private func setCellAttribute(_ sender: UITableViewCell, title: String, isSwitch: Bool, txtColor: UIColor = .textGray) {
        guard let cell = sender as? MyPageCell else {return}
        cell.selectionStyle = .none
        cell.title.text = title
        cell.title.textColor = txtColor
        if (isSwitch) {
            cell.switchs.isHidden = false
            cell.switchs.setOn(true, animated: true)
        }
        else {
            cell.switchs.isHidden = true
        }
    }
}

// MARK: - 프로필 cell
class ProfileCell: UITableViewCell {
    var layout_circle = UIView()
    var img_profile = UIImageView()
    var label_name = UILabel()
    var label_message = UILabel()
    let btn_settingProfile = UIButton()
    let line = UIView()
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ProfileCell")
        self.backgroundColor = .white
        setBaseView()
    }

    private func setBaseView() {
        self.contentView.addSubviews(layout_circle, img_profile, label_name, label_message, btn_settingProfile, line)
        
        layout_circle.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(23)
            make.size.equalTo(85)
        }
        layout_circle.layer.cornerRadius = 81 / 2.0
        layout_circle.translatesAutoresizingMaskIntoConstraints = false
        layout_circle.layer.borderWidth = 1.1
        layout_circle.layer.borderColor = UIColor.lineGray.cgColor
        
        layout_circle.addSubview(img_profile)
        img_profile.snp.makeConstraints() { make in
            make.size.equalTo(75)
            make.center.equalToSuperview()
        }
        img_profile.image = UIImage(named: "noProfileImg")
        img_profile.layer.cornerRadius = 75 / 2.0
        img_profile.clipsToBounds = true
        img_profile.translatesAutoresizingMaskIntoConstraints = false
        
        label_name.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(43)
            make.leading.equalTo(layout_circle.snp.trailing).offset(14)
        }
        label_name.setTxtAttribute("조수연", size: 18, weight: .w600, txtColor: .black)
        
        label_message.snp.makeConstraints() { make in
            make.top.equalTo(label_name.snp.bottom).offset(7)
            make.leading.equalTo(label_name)
        }
        label_message.setTxtAttribute("소개말입니다", size: 15, weight: .w500, txtColor: .lightGray)
        
        btn_settingProfile.snp.makeConstraints() { make in
            make.top.equalTo(img_profile.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalToSuperview().offset(-23)
            make.height.equalTo(35)
        }
        btn_settingProfile.setTitle("프로필 설정", for: .normal)
        btn_settingProfile.setTitleColor(.lightGray, for: .normal)
        btn_settingProfile.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        btn_settingProfile.layer.borderWidth = 1
        btn_settingProfile.layer.borderColor = UIColor.lineGray.cgColor
        btn_settingProfile.layer.cornerRadius = 6
        
        line.snp.makeConstraints() { make in
            make.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }
        line.backgroundColor = .lineGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 마이 페이지 table cell
class MyPageCell: UITableViewCell {
    let title = UILabel()
    let switchs = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "MyPageCell")
        self.backgroundColor = .white
        setBaseView()
    }
    
    private func setBaseView() {
        self.contentView.addSubviews(switchs, title)

        switchs.snp.makeConstraints() { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-25)
        }
        switchs.onTintColor = .darkMain

        title.snp.makeConstraints() { make in
            make.leading.equalToSuperview().offset(23)
            make.centerY.equalToSuperview()
        }
        title.setTxtAttribute("", size: 17, weight: .w400, txtColor: .black)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

