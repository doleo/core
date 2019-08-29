<#--
/*******************************************************************************
* Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/
-->
<#if HarmonyCore.SELECT_RTOS == "BareMetal">
    <#lt>DRV_SDMMC_Tasks(sysObj.drvSDMMC${INDEX?string});
<#elseif HarmonyCore.SELECT_RTOS == "FreeRTOS">
    <#lt>    xTaskCreate( _DRV_SDMMC${INDEX?string}_Tasks,
    <#lt>        "DRV_SDMMC${INDEX?string}_Tasks",
    <#lt>        DRV_SDMMC_STACK_SIZE_IDX${INDEX?string},
    <#lt>        (void*)NULL,
    <#lt>        DRV_SDMMC_PRIORITY_IDX${INDEX?string},
    <#lt>        (TaskHandle_t*)NULL
    <#lt>    );
<#elseif (HarmonyCore.SELECT_RTOS)?? && HarmonyCore.SELECT_RTOS == "ThreadX">
    <#lt>    tx_byte_allocate(&byte_pool_0,
    <#lt>       (VOID **) &_DRV_SDMMC_${INDEX?string}_Task_Stk_Ptr,
    <#lt>        DRV_SDMMC_STACK_SIZE_IDX${INDEX?string},
    <#lt>        TX_NO_WAIT
    <#lt>    );

    <#lt>    tx_thread_create(&_DRV_SDMMC_${INDEX?string}_Task_TCB,
    <#lt>        "DRV_SDMMC${INDEX?string}_TASKS",
    <#lt>        _DRV_SDMMC_${INDEX?string}_Tasks,
    <#lt>        ${INDEX?string},
    <#lt>        _DRV_SDMMC_${INDEX?string}_Task_Stk_Ptr,
    <#lt>        DRV_SDMMC_STACK_SIZE_IDX${INDEX?string},
    <#lt>        DRV_SDMMC_PRIORITY_IDX${INDEX?string},
    <#lt>        DRV_SDMMC_PRIORITY_IDX${INDEX?string},
    <#lt>        TX_NO_TIME_SLICE,
    <#lt>        TX_AUTO_START
    <#lt>    );
</#if>


