package com.gvms.controller;

import com.gvms.action.*;

/**
 * request로 받아온 매개변수의 command의 값으로 각 기능을 수행할 액션을 분기하는 클래스 <br>
 * action추가 시 최대한 기능별로 정렬될 수 있도록 한다. 수정이 잦은 class이므로 주의하여 편집!!
 * 
 * @author cho
 *
 */
public class ActionFactory {

	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;

		System.out.println("ActionFactory : " + command);

		if (command.equals("main")) {
			
			action = new MainAction();
		
		}	else if(command.equals("scoreListForm")) {
			action = new ScoreListFormAction();
		} 
		
			else if(command.equals("scoreListRegForm")) {
			action = new ScoreListRegFormAction();
		}
			else if(command.equals("scoreRegisterForm")) {
			action = new ScoreRegisterFormAction();
		} 
			else if(command.equals("registSearchForm")) {
				action = new RegistSearchFormAction();
			}
			else if(command.equals("regSubSearch")) {
				action = new RegSubjectSearchAction();
			}
			else if(command.equals("regist")) {
				action = new ScoreRegistAction();
			}
			else if(command.equals("readForm")) {
				action = new ScoreReadFormAction();
			}
			else if(command.equals("scoreModifyForm")) {
				action = new ScoreModifyFormAction();
			}
			else if(command.equals("modifySearchForm")) {
				action = new ModifySearchFormAction();
			}
			else if(command.equals("modSubSearch")) {
				action = new ModSubjectSearchAction();
			}
			// author osj
			else if(command.equals("mis_list_form")) {
				action = new MisListFormAction();
			}
			else if(command.equals("mis_regist_form")) {
				action = new MisRegistFormAction();
			}
			else if(command.equals("mis_regist")) {
				action = new MisRegistAction();
			}
			else if(command.equals("mis_read_form")) {
				action = new MisReadFormAction();
			}
			else if(command.equals("mis_read")) {
				action = new MisReadAction();
			}
		return action;
	}

}