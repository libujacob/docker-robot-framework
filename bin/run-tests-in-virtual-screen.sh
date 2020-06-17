#!/bin/sh

HOME=${ROBOT_WORK_DIR}
#HOME=$ROBOT_TESTS_DIR/$ROBOT_TESTS_SUITE
cd $ROBOT_TESTS_DIR/$ROBOT_TESTS_SUITE
# No need for the overhead of Pabot if no parallelisation is required
if [ $ROBOT_THREADS -eq 1 ]
then
    xvfb-run \
        --server-args="-screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} -ac" \
        robot \
        --outputDir $ROBOT_REPORTS_DIR \
        ${ROBOT_OPTIONS} \
        $ROBOT_TESTS_DIR/$ROBOT_TESTS_SUITE
else
    xvfb-run \
        --server-args="-screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} -ac" \
        pabot \
        --verbose \
        --processes $ROBOT_THREADS \
        ${PABOT_OPTIONS} \
        --outputDir $ROBOT_REPORTS_DIR \
        ${ROBOT_OPTIONS} \
        $ROBOT_TESTS_DIR/$ROBOT_TESTS_SUITE
fi
