{*
TestLink Open Source Project - http://testlink.sourceforge.net/
$Id: resultsByStatus.tpl,v 1.19 2010/08/31 19:40:14 mx-julian Exp $
Purpose: show Test Results and Metrics

rev:
	20100719 - Eloff - Implement extTable for this report
	20100527 - BUGID 3492 - show only test case summary for not run test cases
	                        else show exec notes
	20100309 - asimon - added sort hint icon on some columns where it was missing before 
	20091016 - franciscom - results showed in one table for all platform (if any)
*}

{lang_get var='labels' 
          s='th_test_suite,test_case,version,th_build,th_run_by,th_bugs_not_linked,
          th_date,title_execution_notes,th_bugs,summary,generated_by_TestLink_on,
          th_assigned_to,th_platform,platform,info_failed_tc_report,
          info_blocked_tc_report,info_notrun_tc_report'}

{include file="inc_head.tpl"}
<body>
<h1 class="title">{$gui->title|escape}</h1>
<div class="workBack">
{include file="inc_result_tproject_tplan.tpl"
         arg_tproject_name=$gui->tproject_name arg_tplan_name=$gui->tplan_name}

{if $gui->warning_msg == ''}
	{$gui->tableSet[0]->renderCommonGlobals()}
	{if $gui->tableSet[0] instanceof tlExtTable}
		{include file="inc_ext_js.tpl" bResetEXTCss=1}
		{include file="inc_ext_table.tpl"}
	{/if}
	{$gui->tableSet[0]->renderHeadSection()}
	
	{$gui->tableSet[0]->renderBodySection()}
	<br />
	
	{if $gui->bugInterfaceOn && $gui->type != 'n'}
	  <h2 class="simple">{$labels.th_bugs_not_linked}{$gui->without_bugs_counter}</h2>
	  <br />
	{/if}
	
	{if $gui->type == 'f'}
		<p class="italic">{$labels.info_failed_tc_report}</p>
		<br />
	{/if}
	
	{if $gui->type == 'b'}
		<p class="italic">{$labels.info_blocked_tc_report}</p>
		<br />
	{/if}
	
	{if $gui->type == 'n'}
		<p class="italic">{$labels.info_notrun_tc_report}</p>
		<br />
	{/if}
	
	{$labels.generated_by_TestLink_on} {$smarty.now|date_format:$gsmarty_timestamp_format}
{else}
	<br \>
	{$gui->warning_msg}
{/if}
</div>
</body>
</html>
