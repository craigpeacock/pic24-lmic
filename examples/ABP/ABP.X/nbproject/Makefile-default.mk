#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ABP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ABP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../../lmic/aes.c ../../../lmic/lmic.c ../../../lmic/oslmic.c ../../../lmic/radio.c ../../../pic24F/hal.c ../../../pic24F/debug.c ../main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/32495530/aes.o ${OBJECTDIR}/_ext/32495530/lmic.o ${OBJECTDIR}/_ext/32495530/oslmic.o ${OBJECTDIR}/_ext/32495530/radio.o ${OBJECTDIR}/_ext/1274031625/hal.o ${OBJECTDIR}/_ext/1274031625/debug.o ${OBJECTDIR}/_ext/1472/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/32495530/aes.o.d ${OBJECTDIR}/_ext/32495530/lmic.o.d ${OBJECTDIR}/_ext/32495530/oslmic.o.d ${OBJECTDIR}/_ext/32495530/radio.o.d ${OBJECTDIR}/_ext/1274031625/hal.o.d ${OBJECTDIR}/_ext/1274031625/debug.o.d ${OBJECTDIR}/_ext/1472/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/32495530/aes.o ${OBJECTDIR}/_ext/32495530/lmic.o ${OBJECTDIR}/_ext/32495530/oslmic.o ${OBJECTDIR}/_ext/32495530/radio.o ${OBJECTDIR}/_ext/1274031625/hal.o ${OBJECTDIR}/_ext/1274031625/debug.o ${OBJECTDIR}/_ext/1472/main.o

# Source Files
SOURCEFILES=../../../lmic/aes.c ../../../lmic/lmic.c ../../../lmic/oslmic.c ../../../lmic/radio.c ../../../pic24F/hal.c ../../../pic24F/debug.c ../main.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/ABP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GB106
MP_LINKER_FILE_OPTION=,--script=p24FJ256GB106.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/32495530/aes.o: ../../../lmic/aes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/32495530" 
	@${RM} ${OBJECTDIR}/_ext/32495530/aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/32495530/aes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../lmic/aes.c  -o ${OBJECTDIR}/_ext/32495530/aes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/32495530/aes.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/32495530/aes.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/32495530/lmic.o: ../../../lmic/lmic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/32495530" 
	@${RM} ${OBJECTDIR}/_ext/32495530/lmic.o.d 
	@${RM} ${OBJECTDIR}/_ext/32495530/lmic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../lmic/lmic.c  -o ${OBJECTDIR}/_ext/32495530/lmic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/32495530/lmic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/32495530/lmic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/32495530/oslmic.o: ../../../lmic/oslmic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/32495530" 
	@${RM} ${OBJECTDIR}/_ext/32495530/oslmic.o.d 
	@${RM} ${OBJECTDIR}/_ext/32495530/oslmic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../lmic/oslmic.c  -o ${OBJECTDIR}/_ext/32495530/oslmic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/32495530/oslmic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/32495530/oslmic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/32495530/radio.o: ../../../lmic/radio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/32495530" 
	@${RM} ${OBJECTDIR}/_ext/32495530/radio.o.d 
	@${RM} ${OBJECTDIR}/_ext/32495530/radio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../lmic/radio.c  -o ${OBJECTDIR}/_ext/32495530/radio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/32495530/radio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/32495530/radio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1274031625/hal.o: ../../../pic24F/hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1274031625" 
	@${RM} ${OBJECTDIR}/_ext/1274031625/hal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1274031625/hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../pic24F/hal.c  -o ${OBJECTDIR}/_ext/1274031625/hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1274031625/hal.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/1274031625/hal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1274031625/debug.o: ../../../pic24F/debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1274031625" 
	@${RM} ${OBJECTDIR}/_ext/1274031625/debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1274031625/debug.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../pic24F/debug.c  -o ${OBJECTDIR}/_ext/1274031625/debug.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1274031625/debug.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/1274031625/debug.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/32495530/aes.o: ../../../lmic/aes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/32495530" 
	@${RM} ${OBJECTDIR}/_ext/32495530/aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/32495530/aes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../lmic/aes.c  -o ${OBJECTDIR}/_ext/32495530/aes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/32495530/aes.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/32495530/aes.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/32495530/lmic.o: ../../../lmic/lmic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/32495530" 
	@${RM} ${OBJECTDIR}/_ext/32495530/lmic.o.d 
	@${RM} ${OBJECTDIR}/_ext/32495530/lmic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../lmic/lmic.c  -o ${OBJECTDIR}/_ext/32495530/lmic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/32495530/lmic.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/32495530/lmic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/32495530/oslmic.o: ../../../lmic/oslmic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/32495530" 
	@${RM} ${OBJECTDIR}/_ext/32495530/oslmic.o.d 
	@${RM} ${OBJECTDIR}/_ext/32495530/oslmic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../lmic/oslmic.c  -o ${OBJECTDIR}/_ext/32495530/oslmic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/32495530/oslmic.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/32495530/oslmic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/32495530/radio.o: ../../../lmic/radio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/32495530" 
	@${RM} ${OBJECTDIR}/_ext/32495530/radio.o.d 
	@${RM} ${OBJECTDIR}/_ext/32495530/radio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../lmic/radio.c  -o ${OBJECTDIR}/_ext/32495530/radio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/32495530/radio.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/32495530/radio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1274031625/hal.o: ../../../pic24F/hal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1274031625" 
	@${RM} ${OBJECTDIR}/_ext/1274031625/hal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1274031625/hal.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../pic24F/hal.c  -o ${OBJECTDIR}/_ext/1274031625/hal.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1274031625/hal.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/1274031625/hal.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1274031625/debug.o: ../../../pic24F/debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1274031625" 
	@${RM} ${OBJECTDIR}/_ext/1274031625/debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1274031625/debug.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../pic24F/debug.c  -o ${OBJECTDIR}/_ext/1274031625/debug.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1274031625/debug.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/1274031625/debug.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -O0 -ansi -msmart-io=1 -msfr-warn=off   -std=gnu99 -D CFG_sx1276_radio -D CFG_us915
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/ABP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/ABP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F"  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/ABP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/ABP.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"../../../lmic" -I"../../../pic24F" -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/ABP.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
